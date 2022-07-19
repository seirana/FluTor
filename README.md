Relative flux trade-offs and optimization of metabolic network functionalities
Publication
OS
•Code was tested on Fedora 31
Dependencies
•Matlab -tested with 2019b
•COBRA toolbox 3.0
•GNU Linear Programming Kit(glpk) solver -tested with version 5.0
•Gurobi solver(tested with version 9.1.1)
Setup
•Set up the COBRA toolbox following the installation instructions that can be found here 
•Set up the glpk solver toolbox following the installation instruction that can be found here
•Set up the Gurobi solver and connect it with the COBRA toolbox using install instructions that can be found here
Run FluTOr
To reproduce the results presented in the paper run the following scripts
•E. coli: Trade_offs_ecoliijo1366
•S. cerevisiae: Trade_offs_serevisiae
•A. thaliana: Trade_offs_athaliana
How to apply FluTOr to another model
1.create a model which will be using to find tradeoffs. The output of the function must be a model named “model” and the name of the biomass reaction from the field “model.rxns”.
2. Give a name to the string variable “file_name” to the results you want to save it as 
3.flux accuracy must be defined as an integer variable names “rnd” (default value is 1e-5).

4. Then run the following codes respectively
model = CPR(model, rnd,file_name); 
tradeoff_seaker(file_name, model, biomass); 
