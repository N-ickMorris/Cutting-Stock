# ---- Problem 1: Cutting -----------------------------------------------------------------------------------------------------------------------------------

param n >= 0 integer;    # number of possible patterns which cut an L into a variety of q{W}'s

set P := 1..n;    # set of patterns
set W;    # set of possbile widths < L (ie. subwidths) that a costumer can order

param L > 0;    # large roll width
param q{W};    # qty of subwidths demanded by the customer
param a{W, P};    # the amount of q{W}'s in a pattern of P

var x{P} >= 0 integer;    # the number of L's to cut under a pattern of P

minimize Rolls: sum{j in P}(x[j]);    # minimize the total number of large rolls needed 
s.t. Demand{i in W}: sum{j in P}(a[i,j] * x[j]) >= q[i];    # the demand of each width must be met

# ---- Problem 2: Pattern -----------------------------------------------------------------------------------------------------------------------------------

param Crc{W} default 0;    # coefficient of reduced cost for each subwidth

var y{W} >= 0 integer;    # the amount of q{W}'s in a chosen pattern (this corresponds to param a{W, P})

minimize ReducedCost: (1 - sum{i in W}(Crc[i] * y[i]));    # minimize the coefficient of reduced cost 
s.t. LargeRoll: sum{i in W}(i * y[i]) <= L;    # the cumulative size of all subwidths cut into a large roll must be no larger than the size of the large roll


