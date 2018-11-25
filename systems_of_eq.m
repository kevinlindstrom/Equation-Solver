syms v1 v2 v3 v4 v5 v6 v7 test i1 i2 i3 i4 i5 i6 i7
%initial parameters to be substituted
ix = (v1+4)/8;
vx = (v1+2)/16;
id = (30-v1)/3;
%equations to be solved
equation1 = 0 == (v1-v2)/7-60+(v1-10)/3;
equation2 = 0 == (v2-v1)/7+30+(v2-4*id)/2+(v2-30)/3;
equation3 = 0 == v3-v2-15;
equation4 = 0 == 4*i3+10*i4+2-9;
equation5 = 0 == v5;

%solve parameters
number_of_equations = 2;
number_of_variables = 2;
test_exist = false;
use_voltages = true;

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