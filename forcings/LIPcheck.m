%%%% check LIP areas

LIPSTACK = load('forcings/LIPSTACK.mat')
fields = fieldnames(LIPSTACK) ;

for n = 1:35
LIPsum(n) = sum(sum(sum( LIPSTACK.(fields{n}) ))) ;
end
LIPsum = LIPsum';