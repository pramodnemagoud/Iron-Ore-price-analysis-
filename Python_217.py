# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 11:44:50 2024

@author: Pramod nemagouda
"""
""" 
                      PROJECT EXECUTIVE SUMMARY
Project: Iron ore price analysis

Client: One of the leading steel manufacturer in India

-Business Problem: The challenge lies in effectively analyzing the fluctuating prices of iron ore to inform
 strategicinform strategic decision-making for stakeholders in the mining, manufacturing, and energysectors.
 
-Business Objective: Maximize profitability.
-Business Constraint: Minimize costs through informed decision-making based on the analysis of iron ore prices.

Success criteria:
-Business Success Criteria: Achieving a 10% increase in profit margins through optimized procurement and pricing strategies.                          
-Economic Success Criteria: Generating a 20% increase in revenue from iron ore sales within the first year of implementation

# - The Dataset "Iron_ore_dataset" contains 735 rows and 20 columns

1. Business Decisions: You’ve identified four key moments for decision-making based on your analysis.
2. Graphical Representation: You’ve visualized your data, which is essential for understanding trends and distributions.
3. Missing Values: You handled missing values using:
   - Median imputation
   - KNN (K-Nearest Neighbors)
   - Regression methods
4. Data Quality: Confirmed no duplicates in the dataset.
5. Distribution: The data is nearly normally distributed.
6. Outlier Treatment: Addressed outliers in two columns using the median.

"""



import pandas as pd
# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Project_217/row_dataset.xlsx")

# Lodeing row_dataset to mysql
from sqlalchemy import create_engine
# Replace with your actual credentials
user = "root"
password = "pramod108"
database = "project_217"

engine = create_engine(f"mysql+pymysql://{user}:{password}@localhost:3306/{database}")
data.to_sql("row_dataset", con=engine, if_exists='replace', chunksize=None, index=False)
###############################################################################################


data_columns = data.columns
data_columns

data_dtypes= data.dtypes
data_dtypes

##############################################
### Identify duplicate records in the data ###
duplicate = data.duplicated()  # Returns Boolean Series denoting duplicate rows.
duplicate

sum(duplicate) # no duplicate


##############################################
### Null value ###
data.isnull().sum()

## Null value in parcenatage
null_percent = ((data.isnull().sum())/2059)*100
null_percent

# Option 1: Get all numeric data types (including floats)
numeric_columns = data.select_dtypes(include=['float64', 'int64']).columns

##############################################
####### FIRST MOMENT BUSINESS DECISION ##########

######### MEASURE OF CENTRAL TENDENCY ###########


######### MEAN ###########

mean = data[numeric_columns].mean()
mean

######## MEADIAN #########

median = data[numeric_columns].median()
median
######## MODE ############

mode = data[numeric_columns].mode()
mode

############ SECOND MOMENT BUSINESS DECISION ##########

############ MEASURE OF DISPERSION #############


###### VARIANCE #######

variance = data[numeric_columns].var()
variance

######## STANDARD DEVIATION ###########

std_dev = data[numeric_columns].std()
std_dev

####### RANGE ##########
range_data = data[numeric_columns].max() - data[numeric_columns].min()
range_data


############## THIRD MOMENT BUSINESS DECISION #############

############ MEASURE OF ASSEMETRY #############


###### SKEWNESS ########

skewness_data = data[numeric_columns].skew()
skewness_data

############ FOURTH MOMENT BUSINESS DECISION ###########

######## MEASURE OF PEAKNESS ##########


######### KURTOSIS #######

kurtosis_data = data[numeric_columns].kurt() 
kurtosis_data

#########################################################################
import pandas as pd
import numpy as np
from scipy import stats

def calculate_statistics(df):
    # Select numeric columns
    numeric_cols = df.select_dtypes(include=[np.number]).columns
    
    # Initialize an empty DataFrame for storing statistics
    stats_df = pd.DataFrame(index=numeric_cols)
    
    # Calculate statistics
    stats_df['mean'] = df[numeric_cols].mean()
    stats_df['median'] = df[numeric_cols].median()
    stats_df['mode'] = df[numeric_cols].mode().iloc[0]  # Mode can have multiple values, take the first one
    stats_df['variance'] = df[numeric_cols].var()
    stats_df['std_dev'] = df[numeric_cols].std()
    stats_df['range'] = df[numeric_cols].max() - df[numeric_cols].min()
    stats_df['skewness'] = df[numeric_cols].skew()
    stats_df['kurtosis'] = df[numeric_cols].kurtosis()    # Use pandas' kurtosis method instead of scipy.stats.kurtosis

    return stats_df

# Calculate and display statistics
statistics = calculate_statistics(data)
print(statistics)
#Save in new excel sheet
statistics.to_excel("C:/Users/cw/Desktop/statistics1.xlsx", index=True)


# Function to calculate mode for categorical columns
def calculate_mode(data):
    mode_df = data.select_dtypes(include=['object', 'category']).mode()
    return mode_df
# Calculate the mode for all categorical columns
mode_categorical_columns = calculate_mode(data)
print(mode_categorical_columns)


############################ BAR PLOTS ###############################

import pandas as pd
import matplotlib.pyplot as plt

# Load the data
data = pd.read_excel(r"C:/Users/cw/Desktop/Project_217/row_dataset.xlsx")
df = pd.DataFrame(data)

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Create bar charts for each numeric column with 10 bins
for column in numeric_columns:
    plt.figure(figsize=(10, 6))
    df[column].plot(kind='hist', bins=10, alpha=0.7, edgecolor='black')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(True)
    plt.show()

############################ HISTOGRAM PLOTS ###############################

# Plot histograms for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    plt.hist(data[column], bins=20, color='skyblue', edgecolor='black')
    plt.title(f'Histogram of {column}')
    plt.xlabel(column)
    plt.ylabel('Frequency')
    plt.grid(axis='y', alpha=0.75)
    plt.show()


########################## DENSITY PLOTS ##########################################

import seaborn as sns
# Plot density plots for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    sns.kdeplot(data[column], shade=True, color='skyblue')
    plt.title(f'Density Plot of {column}')
    plt.xlabel(column)
    plt.ylabel('Density')
    plt.show()
 
######################### BOX PLOTS ################################################    
        
import seaborn as sns
# Plot box plots for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    sns.boxplot(x=data[column], color='skyblue')
    plt.title(f'Box Plot of {column}')
    plt.xlabel(column)
    plt.show()
 

########################## Q-Q PLOTS ############################################  
# Assuming `data` is your DataFrame with numerical columns
import scipy.stats as stats
# Plot Q-Q plots for numerical columns
for column in data.select_dtypes(include=['float64', 'int64']).columns:
    plt.figure(figsize=(8, 6))
    stats.probplot(data[column], dist="norm", plot=plt)
    plt.title(f'Q-Q Plot for {column}')
    plt.xlabel('Theoretical Quantiles')
    plt.ylabel('Sample Quantiles')
    plt.grid(True)
    plt.show()
    
    
######################### BIVARIATE PLOTS######################################
######################## SCATTER PLOTS ########################################
# Assuming data is loaded and now proceed with plotting
import seaborn as sns
import matplotlib.pyplot as plt


# List of columns to plot scatter plots
columns_to_plot = [
    'Iron_Ore_Price', 'Global_Demand', 'Global_Supply', 'Freight_Rate', 'Stockpile', 
    'Production_Volume', 'Production_Cost', 'Ore_Grade', 'Exchange_Rate_USD', 
    'Interest_Rate', 'Inflation_Rate', 'GDP_Growth_Importer', 'Tariffs', 
    'Steel_Production', 'Carbon_Emissions', 'Aluminum_Price', 'Copper_Price', 
    'Nickel_Price'
]

# Iterate through each pair of 'Date' and the numeric columns to create scatter plots
for column in columns_to_plot:
    plt.figure(figsize=(8, 6))
    sns.scatterplot(x='Date', y=column, data=df)
    plt.title(f'Date vs {column}')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()
   
    
# Iterate through each pair of 'Mining_Location' and the numeric columns to create scatter plots
for column in columns_to_plot:
    plt.figure(figsize=(8, 6))
    sns.scatterplot(x='Mining_Location', y=column, data=df)
    plt.title(f'Mining_Location vs {column}')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()

  # Iterate through each pair of 'Ore_Grade' and the numeric columns to create scatter plots  
for column in columns_to_plot:
    plt.figure(figsize=(8, 6))
    sns.scatterplot(x='Ore_Grade', y=column, data=df)
    plt.title(f'Ore_Grade vs {column}')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()
    
  # Iterate through each pair of 'Date' and the numeric columns to create scatter plots

    
    
data.select_dtypes(include=['object', 'category']).mode() 
    
##############################################################################
numeric_df = df[numeric_columns]

# Calculate correlation matrix
corr_matrix = numeric_df.corr()

# Plotting the correlation matrix using seaborn
plt.figure(figsize=(30, 24))  # Adjust the figure size (width, height) as necessary
sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', fmt='.2f', linewidths=0.5)
plt.title('Correlation Matrix of Numeric Columns', fontsize=20)
plt.xticks(rotation=45)
plt.yticks(rotation=0)
plt.tight_layout()
plt.show()


###############################################################################
'''___________________________ Type casting ________________________________'''
###############################################################################
df = pd.DataFrame(data)
# Convert datetime using the specified format
df['Date'] = pd.to_datetime(df['Date'], format='%m/%d/%Y')

# Verify the conversion
print(df['Date'].head())

###############################################################################
'''____________________________ Handling Duplicates _______________________ '''
###############################################################################

### Identify duplicate records in the data ###
duplicate = df.duplicated()  # Returns Boolean Series denoting duplicate rows.
duplicate

sum(duplicate)

###############################################################################
'''____________________________ Missing values ____________________________ '''
###############################################################################

# Identify missing values
missing_values = df.isnull().sum()

# Print the columns with missing values and their counts
print("Missing Values:")
print(missing_values[missing_values > 0])

#median for numeric columns
df['Iron_Ore_Price'] = df['Iron_Ore_Price'].fillna(df['Iron_Ore_Price'].median())
df['Global_Demand'] = df['Global_Demand'].fillna(df['Global_Demand'].median())
df['Global_Supply'] = df['Global_Supply'].fillna(df['Global_Supply'].median())
df['Freight_Rate'] = df['Freight_Rate'].fillna(df['Freight_Rate'].median())
df['Stockpile'] = df['Stockpile'].fillna(df['Stockpile'].median())
df['Production_Volume'] = df['Production_Volume'].fillna(df['Production_Volume'].median())
df['Production_Cost'] = df['Production_Cost'].fillna(df['Production_Cost'].median())
df['Exchange_Rate_USD'] = df['Exchange_Rate_USD'].fillna(df['Exchange_Rate_USD'].median())
df['Interest_Rate'] = df['Interest_Rate'].fillna(df['Interest_Rate'].median())
df['Inflation_Rate'] = df['Inflation_Rate'].fillna(df['Inflation_Rate'].median())
df['GDP_Growth_Importer'] = df['GDP_Growth_Importer'].fillna(df['GDP_Growth_Importer'].median())
df['Tariffs'] = df['Tariffs'].fillna(df['Tariffs'].median())
df['Steel_Production'] = df['Steel_Production'].fillna(df['Steel_Production'].median())
df['Carbon_Emissions'] = df['Carbon_Emissions'].fillna(df['Carbon_Emissions'].median())
df['Aluminum_Price'] = df['Aluminum_Price'].fillna(df['Aluminum_Price'].median())
df['Copper_Price'] = df['Copper_Price'].fillna(df['Copper_Price'].median())
df['Nickel_Price'] = df['Nickel_Price'].fillna(df['Nickel_Price'].median())

#mode for catogary columns 
df['Ore_Grade'] = df['Ore_Grade'].fillna(df['Ore_Grade'].mode()[0])
df['Mining_Location'] = df['Mining_Location'].fillna(df['Mining_Location'].mode()[0])


##################  KNNImputer        ##############################
'''The KNNImputer uses the nearest neighbors to predict missing values.
n_neighbors=5 specifies that it will consider the 5 nearest rows to impute the missing values.
This code will replace the missing values in all the specified columns with values computed using KNN.'''

from sklearn.impute import KNNImputer
import pandas as pd

# Selecting the relevant columns
columns_to_impute = [
    'Iron_Ore_Price', 'Global_Demand', 'Global_Supply', 'Freight_Rate', 
    'Stockpile', 'Production_Volume', 'Production_Cost', 'Exchange_Rate_USD',
    'Interest_Rate', 'Inflation_Rate', 'GDP_Growth_Importer', 'Tariffs',
    'Steel_Production', 'Carbon_Emissions', 'Aluminum_Price', 'Copper_Price', 
    'Nickel_Price'
]

# Initialize the KNN imputer
knn_imputer = KNNImputer(n_neighbors=5)

# Apply the imputer to the selected columns
df[columns_to_impute] = pd.DataFrame(knn_imputer.fit_transform(df[columns_to_impute]), columns=columns_to_impute)

#After Fill missing Identify missing values
missing_values = df.isnull().sum()
# Print the columns with missing values and their counts
print("Missing Values:")
print(missing_values[missing_values > 0])


#################### Regression Imputation ############################
#Approach 1: Preprocess Features with Imputation
#You can use SimpleImputer from sklearn to fill missing values in the feature columns before applying the regression model.
import pandas as pd
# Load the data
data = pd.read_excel(r"C:/Users/cw/Desktop/Project_217/row_dataset.xlsx")
df = pd.DataFrame(data)

import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

# Assuming `df` is your dataframe

# List of columns to impute
columns_to_impute = [
    'Iron_Ore_Price', 'Global_Demand', 'Global_Supply', 'Freight_Rate', 
    'Stockpile', 'Production_Volume', 'Production_Cost', 'Exchange_Rate_USD',
    'Interest_Rate', 'Inflation_Rate', 'GDP_Growth_Importer', 'Tariffs',
    'Steel_Production', 'Carbon_Emissions', 'Aluminum_Price', 'Copper_Price', 
    'Nickel_Price'
]

import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.impute import SimpleImputer
import numpy as np

# Function for regression imputation
def regression_impute(df, target_column, feature_columns):
    # Step 1: Split data into rows with and without missing values in the target column
    train_data = df[df[target_column].notna()]
    test_data = df[df[target_column].isna()]

    # Check if there are enough data points for training and predicting
    if len(train_data) == 0:
        print(f"Skipping {target_column}: No available data for training.")
        return
    if len(test_data) == 0:
        print(f"Skipping {target_column}: No missing values to predict.")
        return

    # Step 2: Handle missing values in the feature columns using mean imputation
    imputer = SimpleImputer(strategy='mean')
    
    # Fit imputer on the training data (for the feature columns)
    X_train = imputer.fit_transform(train_data[feature_columns])  # Impute missing features in training data
    y_train = train_data[target_column]  # Target for training
    
    X_test = imputer.transform(test_data[feature_columns])  # Apply the same imputation on test data

    # Step 3: Train regression model
    model = LinearRegression()
    model.fit(X_train, y_train)

    # Step 4: Predict missing values
    predicted_values = model.predict(X_test)

    # Step 5: Fill missing values
    df.loc[df[target_column].isna(), target_column] = predicted_values
    print(f"Imputed missing values for {target_column}.")

# Impute each column with missing data using regression
for col in columns_to_impute:
    feature_cols = [c for c in columns_to_impute if c != col]  # All other columns as features
    regression_impute(df, col, feature_cols)
    
################# HistGradientBoostingRegressor (Alternative Model)############################
#####Approach 2: Use HistGradientBoostingRegressor (Alternative Model)
#If you'd like to use a model that can handle missing values in features directly, you can replace LinearRegression with HistGradientBoostingRegressor:
from sklearn.ensemble import HistGradientBoostingRegressor

def regression_impute_with_hgb(df, target_column, feature_columns):
    # Step 1: Split data into rows with and without missing values in the target column
    train_data = df[df[target_column].notna()]
    test_data = df[df[target_column].isna()]

    # Check if there are enough data points for training and predicting
    if len(train_data) == 0:
        print(f"Skipping {target_column}: No available data for training.")
        return
    if len(test_data) == 0:
        print(f"Skipping {target_column}: No missing values to predict.")
        return

    # Step 2: Train HistGradientBoostingRegressor, which can handle NaN values directly
    X_train = train_data[feature_columns]  # Features for training
    y_train = train_data[target_column]    # Target for training
    
    X_test = test_data[feature_columns]    # Features for predicting

    # Initialize and train the model
    model = HistGradientBoostingRegressor()
    model.fit(X_train, y_train)

    # Step 3: Predict missing values
    predicted_values = model.predict(X_test)

    # Step 4: Fill missing values
    df.loc[df[target_column].isna(), target_column] = predicted_values
    print(f"Imputed missing values for {target_column}.")

# Impute each column with missing data using HistGradientBoostingRegressor
for col in columns_to_impute:
    feature_cols = [c for c in columns_to_impute if c != col]  # All other columns as features
    regression_impute_with_hgb(df, col, feature_cols)



###############################################################################
'''____________________________ Outliers ___________________________________'''
###############################################################################

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the Excel file into a DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Project_217/row_dataset.xlsx")  
df = pd.DataFrame(data)  

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Initialize an empty dictionary to store outliers for each column
outliers_dict = {}

# Store original DataFrame for plotting
df_original = df.copy()

# Iterate over each numeric column
for col in numeric_columns:
    Q1 = df[col].quantile(0.25)  # Calculate the first quartile (25th percentile)
    Q3 = df[col].quantile(0.75)  # Calculate the third quartile (75th percentile)
    IQR = Q3 - Q1  # Calculate the interquartile range (IQR)
    lower_bound = Q1 - 1.5 * IQR  # Calculate the lower bound for outliers
    upper_bound = Q3 + 1.5 * IQR  # Calculate the upper bound for outliers

    # Identify outliers
    outliers = df[(df[col] < lower_bound) | (df[col] > upper_bound)]  # Find outliers outside the lower and upper bounds

    # Store outliers in the dictionary if there are any
    if not outliers.empty:
        outliers_dict[col] = outliers

    # Compute the median of the column
    median = df[col].median()

    # Replace outliers with the median in the original DataFrame
    df.loc[(df[col] < lower_bound) | (df[col] > upper_bound), col] = median

# Plot boxplots for columns with outliers before and after replacing outliers with median
for col in outliers_dict.keys():
    fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(12, 6))

    # Boxplot before removing outliers
    sns.boxplot(y=df_original[col], ax=axes[0])
    axes[0].set_title(f'Boxplot of {col} (Before)')

    # Boxplot after replacing outliers with median
    sns.boxplot(y=df[col], ax=axes[1])
    axes[1].set_title(f'Boxplot of {col} (After)')

    plt.tight_layout()
    plt.show()


# Save the cleaned DataFrame to a new Excel file
cleaned_file_path = r"C:/Users/cw/Desktop/Project_217/Cleaned_Dataset.xlsx"
df.to_excel(cleaned_file_path, index=False)



###############################################################################
'''____________________ Zero & near Zero Variance feature__________________ '''
###############################################################################

variance = data.var()
near_zero_var_features = variance[variance < 0.01]
print(near_zero_var_features)


###############################################################################
'''____________________ Normalization _____________________ '''
###############################################################################
import pandas as pd
from sklearn.preprocessing import MinMaxScaler

# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Project_217/row_dataset.xlsx")
df = pd.DataFrame(data)

# Select numeric columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns

# Initialize the MinMaxScaler
scaler = MinMaxScaler()

# Apply the scaler to the numeric columns
df[numeric_columns] = scaler.fit_transform(df[numeric_columns])
print(data)

# Save the normalized DataFrame to a new Excel file
normalized_file_path = r"C:/Users/cw/Desktop/Project_217/Normalized_Dataset.xlsx"
df.to_excel(normalized_file_path, index=False)


###############################################################################
'''____________________Z-Score Normalization (Standardization) _______________________'''
###############################################################################

from sklearn.preprocessing import StandardScaler

# Initialize the StandardScaler
scaler = StandardScaler()

# Apply the scaler to the numeric columns
df[numeric_columns] = scaler.fit_transform(df[numeric_columns])

# Save the standardized DataFrame to a new Excel file
standardized_file_path = r"C:/Users/cw/Desktop/Project_217/Standardized_Dataset.xlsx"
df.to_excel(standardized_file_path, index=False)




###################EDA after data preprocessing##############

numeric_columns = data.select_dtypes(include=['float64', 'int64']).columns

##############################################
####### FIRST MOMENT BUSINESS DECISION ##########

######### MEASURE OF CENTRAL TENDENCY ###########


######### MEAN ###########

mean = data[numeric_columns].mean()
mean

######## MEADIAN #########

median = data[numeric_columns].median()
median
######## MODE ############

mode = data[numeric_columns].mode()
mode

############ SECOND MOMENT BUSINESS DECISION ##########

############ MEASURE OF DISPERSION #############


###### VARIANCE #######

variance = data[numeric_columns].var()
variance

######## STANDARD DEVIATION ###########

std_dev = data[numeric_columns].std()
std_dev

####### RANGE ##########
range_data = data[numeric_columns].max() - data[numeric_columns].min()
range_data


############## THIRD MOMENT BUSINESS DECISION #############

############ MEASURE OF ASSEMETRY #############


###### SKEWNESS ########

skewness_data = data[numeric_columns].skew()
skewness_data

############ FOURTH MOMENT BUSINESS DECISION ###########

######## MEASURE OF PEAKNESS ##########


######### KURTOSIS #######

kurtosis_data = data[numeric_columns].kurt() 
kurtosis_data









import pandas as pd
# Read the XLSX file into a Pandas DataFrame
data = pd.read_excel(r"C:/Users/cw/Desktop/Project_217/Cleaned_Dataset.xlsx")
import pandas as pd
import numpy as np
from scipy import stats

def calculate_statistics(df):
    # Select numeric columns
    numeric_cols = df.select_dtypes(include=[np.number]).columns
    
    # Initialize an empty DataFrame for storing statistics
    stats_df = pd.DataFrame(index=numeric_cols)
    
    # Calculate statistics
    stats_df['mean'] = df[numeric_cols].mean()
    stats_df['median'] = df[numeric_cols].median()
    stats_df['mode'] = df[numeric_cols].mode().iloc[0]  # Mode can have multiple values, take the first one
    stats_df['variance'] = df[numeric_cols].var()
    stats_df['std_dev'] = df[numeric_cols].std()
    stats_df['range'] = df[numeric_cols].max() - df[numeric_cols].min()
    stats_df['skewness'] = df[numeric_cols].skew()
    stats_df['kurtosis'] = df[numeric_cols].kurtosis()    # Use pandas' kurtosis method instead of scipy.stats.kurtosis

    return stats_df

# Calculate and display statistics
statistics = calculate_statistics(data)
print(statistics)
#Save in new excel sheet
statistics.to_excel("C:/Users/cw/Desktop/stat_after_prepr.xlsx", index=True)

