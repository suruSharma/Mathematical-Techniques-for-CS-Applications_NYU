function [P,I] = NBProbability2(S, D, N)

X = unique(D);%includes 0 (no disease possibility)

k = numel(find(unique(D)~=0));%actual number of diseases

P = zeros(k,1);

I = zeros(k,1);

symptoms = size(S,2);%number of symptons recorded

totalPatients = size(D,1);

totalPatientsPerDisease = zeros(k,1);%total number of patients per disease

diseaseIndex = 0;

for j = 1:size(X,1)
    if X(j,1) ~= 0
        diseaseIndex = diseaseIndex + 1;
        I(diseaseIndex,1)=X(j,1);
        totalPatientsPerDisease(diseaseIndex,1) = numel(find(D == X(j,1)));
    end
end

for i= 1: k
    disease = I(i,1);
    Pdisease = totalPatientsPerDisease(i,1)/totalPatients;
    prob_Nmatrix = zeros(1,symptoms);
    for j=1:symptoms
        symptom_found = 0;
        for a=1:totalPatients
            if D(a,1) == disease && S(a,j) == N(1,j)
                symptom_found = symptom_found+1;
            end
        end
        prob_Nmatrix(1,j) = symptom_found/totalPatientsPerDisease(i,1);
    end
    
    P(k,1) = prod(prob_Nmatrix) * Pdisease;
end
P = normr(P);
end


%Input:
%S = [1,0,0,1;1,1,0,0;1,0,1,1;0,1,0,1;0,0,0,0;0,1,1,1;0,1,1,0;1,1,0,1];
%D=[0;1;1;1;0;1;0;1];
%N=[1,0,0,0];

%[P,I] = NBProbability2(S,D,N)
%P =

%     1


%I =

%     1
