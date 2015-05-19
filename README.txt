 - Load the folder into matlab.
 - Run the train_N_times function with, for example, the following line in the console:

[~,~] = train_N_times(0.0, 0.5, 300, 'sarsa', 'linear', 50);

The parameters are as follows:

1: epsilon start value. 
2. learning rate (also used as discount factor)
3. number of trials within a training cycle
4. 'sarsa' or 'qlearn'. sarsa uses eligibility trace.
5. 'linear' or 'static' - defines the use of dynamic or static epsilon
6. N - number of training runs to make before averaging and plotting results.