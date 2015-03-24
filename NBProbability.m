function P = NBProbability(S, D, N)
fluPatients = find(D~=0);

NoOfFluPatients = numel(fluPatients);

totalPatients = size(D,1);

symptoms = size(S,2);

PFlu = NoOfFluPatients/totalPatients;

prob_Nmatrix = zeros(1,symptoms);

for j = 1: symptoms
    symptom_found = 0;
    for i = 1:totalPatients
        if D(i,1) == 1 && S(i,j) == N(1,j)
            symptom_found = symptom_found +1;
        end
    end
    prob_Nmatrix(1,j) = symptom_found/NoOfFluPatients;
end
P = prod(prob_Nmatrix) * PFlu;
end


%Output:
%P = NBProbability (S,D,N)

%P =

%    0.0090
