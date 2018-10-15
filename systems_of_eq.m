syms v1 v2 v3 v4 v5 v6 v7 test
%initial parameters to be substituted
ix = (v1+4)/8;
vz = -v1*(2/3);
%equations to be solved
equation1 = 0 == (v1-v3)/4+(v1-v2)/6+(v1+4)/8+(v1-v3)/2;
equation2 = 0 == 3+(v2-v1)/6+v2/12;
equation3 = 0 == -3+(v3-v1)/4+(v3-v1)/2+4*ix;
equation4 = 0 == v4;
equation5 = 0 == v5;

%solve parameters
number_of_equations = 3;
number_of_variables = 3;
test_exist = false;

%items to be iterated over
list_eqs = [equation1, equation2, equation3, equation4, equation5];
list_var = [v1, v2, v3, v4, v5, v6, v7];
eqs = [];
var = [];

%sets up the matricies to be solved
for c = 1:number_of_equations
    eqs = [eqs, list_eqs(c)];
end
for c = 1:number_of_variables
    var = [var, list_var(c)];
end
if test_exist == true
    var = [var, test];
end

%converts equations to matricies and solves
[A,B] = equationsToMatrix(eqs, var);
disp([A,B])
sol = rref([A,B]);
%disp(sol)

%matrix multiplication to show output 
results = sol(:,end);
varible_side = sol(:,1:end-1);
result_equations = mtimes(varible_side,rot90(var,-1))==results;
disp(result_equations)