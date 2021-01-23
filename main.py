# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


# Press the green button in the gutter to run the script.
import re

import os
import pdflatex


def change_date(txt):
    """
    :type txt: str
    """
    txt = re.sub(r"Spring 2020", r"Spring 2021", txt, flags=re.M)
    txt = re.sub(r"Due: ...\. \d{2}/\d{2}/\d{2}", r"Due: ***. **/**/21", txt, flags=re.M)
    return txt


def change_description(txt):
    """
    :type txt: str
    """
    new_context = re.escape(r'''\ifprintanswers
\noindent \textbf{Instructions:} All assignments are due \underline{by
\textbf{midnight} on the due date} specified.  Assignments should be typed or
scanned and submitted as a PDF in Canvas.   

\medskip
\noindent Every student or student group must write up their own solutions in
their own manner.

\medskip
\noindent You should \underline{complete all problems}, but \underline{only a
subset will be graded} (which will be graded is not known to you ahead of
time). 
\else
\noindent \textbf{Instructions:} All assignments are due \underline{by \textbf{midnight} on the due date} specified.  

\medskip
\noindent Every student or student group  must write up their own solutions in
their own manner.

\medskip
\noindent Please present your solutions in a clean, understandable
manner.  Use the provided files that give mathematical notation in Word, Open Office, Google Docs, and \LaTeX. 

\medskip
\noindent Assignments should be typed or scanned and submitted as a PDF.   

\medskip
\noindent You should \underline{complete all problems}, but \underline{only a
subset will be graded} (which will be graded is not known to you ahead of
time). 
\fi''')
    txt = re.sub(r'\\ifprintanswers\n(.*\n)*\\fi', new_context, txt, flags=re.M)
    print(txt)
    # txt = re.sub(r"Due: ...\. \d{2}/\d{2}/\d{4}", r"Due: \*\*\*\. \*\*/\*\*/2021")
    return txt


def change_ref_book(txt, pattern_file_txt):
    """
    :type txt: str
    :type pattern_file_txt: str
    """
    patterns = pattern_file_txt.splitlines()
    for pattern in patterns:
        strings = pattern.split()
        old_pattern_0_s = strings[0].split(sep=".")
        page_old = strings[1]
        page_old = page_old[1:]
        page_new = strings[3]
        page_new = page_new[1:]
        # print(page_old)
        old_pattern = fr"(?:{old_pattern_0_s[0]}\.{old_pattern_0_s[1]}(?:\.|,? ?\\?# ?|,? ?Exercise ?){old_pattern_0_s[2]})(\D.*[pP]\.? ?){page_old}"

        old_pattern_no_page = fr"(?:{old_pattern_0_s[0]}\.{old_pattern_0_s[1]}(?:\.|,? ?\\?# ?|,? ?Exercise ?){old_pattern_0_s[2]})(\D)"

        new_pattern = strings[2] + r"\g<1>" + page_new
        new_pattern_no_page = strings[2] + r"\1"

        print(old_pattern)
        result = re.search(old_pattern, txt)

        if result is None:
            print("not find {}".format(old_pattern))
        else:
            print("find {}, convert to {}".format(result.group(0),
                                                  "{}{}{}".format(strings[2], result.group(1), page_new)))
            txt = re.sub(old_pattern, new_pattern, txt)
        # sub no page quests
        print(old_pattern_no_page)
        result = re.search(old_pattern_no_page, txt)

        if result is None:
            print("not find {}".format(old_pattern_no_page))
        else:
            print("find {}, convert to {}".format(result.group(0),
                                                  "{}{}".format(strings[2], result.group(1))))
            txt = re.sub(old_pattern_no_page, new_pattern_no_page, txt)

        # print(old_pattern)
        # exit(-1)

        # txt = re.sub(old_pattern, new_pattern, txt)
    # print(txt)

    return txt


if __name__ == '__main__':
    origin_names = ["hw" + str(i) for i in range(2, 12)]
    print(origin_names)
    new_names = [old_name + "new" for old_name in origin_names]
    new_folders = ["cs2311HWs/{}".format(newname) for newname in new_names]
    print(new_names)
    print(new_folders)

    for new_fd in new_folders:
        if not os.path.exists(new_fd):
            os.mkdir(new_fd)
    atxt_names = ["atxts/{}/a.txt".format(hw) for hw in origin_names]
    print(atxt_names)
    for i in range(len(origin_names)):
        print(origin_names[i])
        print(new_names[i])
        old_file = "cs2311HWs/{}/{}.tex".format(origin_names[i], origin_names[i])
        old_txt = open(old_file).read()
        body_file_name = re.findall(r"\\input\{(hw.+)}", old_txt)[0] + ".tex"
        print(body_file_name)
        old_file = "cs2311HWs/{}/{}".format(origin_names[i], body_file_name)
        old_txt = open(old_file).read()
        # print(old_txt)

        new_file = "cs2311HWs/{}/{}".format(new_names[i], body_file_name)
        old_txt = change_date(old_txt)
        old_txt = change_description(old_txt)
        # print(old_txt)

        atxtfile = open(atxt_names[i]).read()
        old_txt = change_ref_book(old_txt, atxtfile)
        f = open(new_file, mode="w")
        if f is None:
            exit(-1)
        f.write(old_txt)
        from pdflatex import PDFLaTeX

        # pdfl = PDFLaTeX.from_texfile(new_file)
        # pdf, log, completed_process = pdfl.create_pdf(keep_pdf_file=True, keep_log_file=False)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
