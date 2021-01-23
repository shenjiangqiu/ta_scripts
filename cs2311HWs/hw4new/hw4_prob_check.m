
%% problem 1 

R = [0 0 0 0 1; 1 0 0 0 0; 0 0 0 1 0; 0 1 0 0 0; 0 0 0 0 1];
d2 = {'a', 'b', 'c', 'd', 'e'};

fprintf('\n\nProb 1');
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



%% Problem 2

R = [0 0 0 0 1; 0 0 0 1 0; 0 1 0 0 0; 0 0 1 0 1; 1 1 0 0 0];
d2 = {'CMX', 'DTW', 'MQT', 'MSP', 'ORD'};

fprintf('\n\nb) R \n');
print_relation(R, d2);

fprintf('\n\nc) R matrix\n');
R

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