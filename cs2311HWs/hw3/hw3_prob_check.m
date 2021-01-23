%% PP3 Check 

R1 = [1 0 0 0; 0 0 1 0; 1 0 0 1; 1 0 1 0];
R2 = [1 1 0 1; 1 1 0 1; 1 0 1 0; 0 0 0 0];

domain = {'a', 'b', 'c', 'd'};
fprintf('\n\nProb 4');
fprintf('\nR1: ');
print_relation(R1, domain);
fprintf('\nR2: ');
print_relation(R2, domain);

fprintf('\na) R1 U R2\n');
print_relation(or(R1,R2), domain);

fprintf('\n\nb) R1 \\cap R2\n');
print_relation(and(R1,R2), domain);

fprintf('\n\nc) R1 - R2 \n');
print_relation(R1 - R2, domain);

fprintf('\n\nd) R2 - R1 \n');
print_relation(R2 - R1, domain);

fprintf('\n\ne) R1 comp\n');
print_relation(ones(4) - R1, domain);

fprintf('\n\nf) R2^{-1} \n');
print_relation(R2', domain);

fprintf('\n\ng) R1 o R2 \n');
print_relation(R2*R1, domain);

fprintf('\n\nh) R2 o R1 \n');
print_relation(R1*R2, domain);

fprintf('\n\ni) R1^2 \n');
print_relation(R1*R1, domain);

fprintf('\n\nj) R2^3 \n');
fprintf('R2^2 = ');
R22 = R2*R2;
print_relation(R22, domain);
fprintf('\nR2^3 \n');
print_relation(R*R22, domain);



%%
% problem 6
R = [1 0 0 0; 0 0 1 0; 0 1 0 1; 0 0 1 1];
S = [1 0 0 1; 1 1 0 1; 1 0 1 0; 0 0 1 1];
T = [1 1 0 0; 0 0 1 1; 0 0 0 1; 1 1 0 0];
% S = [1 0 0 1; 1 1 0 1; 1 0 1 0; 0 0 1 1];
% T = [1 1 0 0; 0 0 1 1; 0 0 0 1; 1 1 0 0];
U = [1 0 0 1; 0 0 1 1; 1 0 0 0; 0 0 0 1];

domain = {'a', 'b', 'c', 'd'};
fprintf('\n\nProb 6');
fprintf('\nR: ');
print_relation(R, domain);
fprintf('\nS: ');
print_relation(S, domain);
fprintf('\nT: ');
print_relation(T, domain);
fprintf('\nU: ');
print_relation(U, domain);

fprintf('\n\na) R U S \n');
print_relation(or(R,S), domain)

fprintf('\n\nb) R \\cap S\n');
print_relation(and(R, S), domain)

fprintf('\n\nc) R - S \n');
print_relation(R - S, domain);

fprintf('\n\nd) S - R \n');
print_relation(S - R, domain);

fprintf('\n\ne) S comp\n');
print_relation(ones(4)-S, domain);

fprintf('\n\nf) S^-1\n');
print_relation(S', domain);

fprintf('\n\ng) T o T\n');
print_relation(T*T, domain);

fprintf('\n\nh) U o T\n');
print_relation(T*U, domain);

% %fprintf('\n\nh) T o R\n');
% %print_relation(R*T, domain);

fprintf('\n\ni) T o U\n');
print_relation(U*T, domain);

% % fprintf('\n\ni) R o T\n');
% % print_relation(T*R, domain);

fprintf('\n\nj) R^3\n');
R2 = R*R;
R3 = R*R2;
print_relation(R2, domain);
fprintf('\n\n');
print_relation(R3, domain);
fprintf('\n\n');

fprintf('\n\nk) U^3\n');
U2 = U*U;
U3 = U*U2;
print_relation(U2, domain);
fprintf('\n\n');
print_relation(U3, domain);
fprintf('\n\n');

fprintf('\n\nl) R o S o T\n');
print_relation(T*S*R, domain);
fprintf('\n');


%% problem 6 

R = [0 0 0 1 0; 0 0 1 0 0; 0 1 0 0 0; 0 0 0 0 1; 0 0 0 0 0];
d2 = {'a', 'b', 'c', 'd', 'e'};

fprintf('\n\nProb 6');
fprintf('\nR\n');
print_relation(R, d2);

fprintf('\n\na) Delta \n');
print_relation(eye(size(R,1)), d2);

fprintf('\n\n R U Delta\n');
print_relation(or(R, eye(size(R,1))), d2);

fprintf('\n\nb) R^-1\n');
print_relation(R', d2);

fprintf('\n\n R U R^-1\n');
print_relation(or(R,R'), d2);


fprintf('\n\nc) R^2 \n');
print_relation(R*R, d2);
fprintf('\n\nd) R^3\n');
R2 = R*R;
R3 = R*R2;
print_relation(R3, d2);
fprintf('\n R4');

R4 = R*R3;
R5 = R*R4;
print_relation(R4, d2);
fprintf('\n R5');
print_relation(R5, d2);
fprintf('\n');
fprintf('\n\nf) R*\n');
print_relation(or(R, or(R2, or(R3, or(R4,R5)))), d2);
fprintf('\n');


%% Problem 7

R = [0 0 0 0 1; 0 0 1 0 0; 0 0 0 0 0; 0 0 1 0 1; 1 1 0 0 0];
d2 = {'CMX', 'DTW', 'MQT', 'MSP', 'ORD'};

fprintf('\n\nd) Delta \n');
print_relation(eye(size(R,1)), d2);

fprintf('\n\ne) R U Delta\n');
print_relation(or(R, eye(size(R,1))), d2);

fprintf('\n\nf) R^-1\n');
print_relation(R', d2);

fprintf('\n\ng) R U R^-1\n');
print_relation(or(R,R'), d2);

fprintf('\n\ni) R^2 \n');
print_relation(R*R, d2);

fprintf('\n\nk) R^3\n');
R2 = R*R;
R3 = R*R2;
print_relation(R3, d2);

fprintf('\n\n   R^4\n');
R4 = R*R3;
R5 = R*R4;
print_relation(R4, d2);
fprintf('\n\n    R^5\n');
print_relation(R5, d2);

fprintf('\n\nm) R^*\n');
print_relation(or(R, or(R2, or(R3, or(R4,R5)))), d2);
fprintf('\n');


% % prob 4
% R = [0 1 0 0 1; 0 1 1 0 0; 0 1 0 0 0; 0 0 1 0 1; 0 1 0 0 0];
% d2 = {'1', '2', '3', '4', '5'};
% fprintf('\nR\n');
% print_relation(R, d2);
% 
% fprintf('\n\nb) Delta \n');
% print_relation(eye(size(R,1)), d2);
% 
% fprintf('\n\nc) R U Delta\n');
% print_relation(or(R, eye(size(R,1))), d2);
% 
% fprintf('\n\nd) R^-1\n');
% print_relation(R', d2);
% 
% fprintf('\n\ne) R U R^-1\n');
% print_relation(or(R,R'), d2);
% 
% fprintf('\n\nf) R^2 \n');
% print_relation(R*R, d2);
% fprintf('\n R^3\n');
% R2 = R*R;
% R3 = R*R2;
% print_relation(R3, d2);
% 
% R4 = R*R3;
% R5 = R*R4;
% fprintf('\n\ng) R*\n');
% print_relation(or(R, or(R2, or(R3, or(R4,R5)))), d2);
% fprintf('\n');
% 
