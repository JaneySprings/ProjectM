/// @function scrDelta_init( delta, var1, var2... )

Delta = argument[0];
d_var_count = argument_count - 1;
d_var_current = 1;

for (var i = 0; i < argument_count-1; i++)
	d_var[i] = argument[i+1];