syms v1 v2 v3 v4 v5 v6 v7 test i1 i2 i3 i4 i5 i6 i7
%initial parameters to be substituted
ib = sqrt(2);
ia = 2;

%equations to be solved
equation1 = 0 == (-3j+1j+5)*i1+3j*ib-1j*i2;
equation2 = 0 == (1j-2j+5)*i2-1j*i1;
equation3 = 0 == v2;
equation4 = 0 == i4;
equation5 = 0 == v5;

%solve parameters
number_of_equations = 2;
number_of_variables = 2;
test_exist = false;
use_voltages = false;

%items to be iterated over
list_eqs = [equation1, equation2, equation3, equation4, equation5];
list_var_v = [v1, v2, v3, v4, v5, v6, v7];
list_var_i = [i1, i2, i3, i4, i5, i6, i7];
eqs = [];
var = [];

%sets up the matricies to be solved
for c = 1:number_of_equations
    eqs = [eqs, list_eqs(c)];
end
for c = 1:number_of_variables
    if use_voltages == true
        var = [var, list_var_v(c)];
    end
    if use_voltages == false
        var = [var, list_var_i(c)];
    end
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