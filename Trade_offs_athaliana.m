clc;clear;

file_name = 'ArabidopsisCoreModel';
rnd =1e-5;  % flux accuracy equals 1e-5
nit_amu = {'NO3','NH4','50:50'};
active_bio = {'Bio_CLim','Bio_NLim','Bio_opt'};

for b = 1:3
    for na = 1:3
        for j = 1:3
            lb_bio = 0.85+j*0.05;
            
            [mdl1, biomass] = model_athaliana(file_name, rnd, lb_bio, active_bio(b), nit_amu(na)); % read the model
            
            mdl2 = QFCA(mddl1, rnd); % modified QFCA function
            mdl2.F2C2.fctable = FC_F2C2(mdl2); % modified F2C2 function
            model = QFCA_F2C2_subscription(mdl2); % find mutual fully coupled reactions
            
            f_name = strcat(file_name, '_bio=', string(active_bio(b)), '_', string(nit_amu(na)), '_lb=', string(lb_bio));
            save(strcat(adrs, f_name, '_model.mat'),'model'); % save model
            
            tradeoff_seaker(f_name, model, biomass); % find_tradeoffs
        end
    end
end
