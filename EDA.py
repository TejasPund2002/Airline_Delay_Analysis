import pandas as pd
import mysql.connector
from sqlalchemy import create_engine
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Load Dataset
# -----------------------------
df = pd.read_csv("Airline_Delay_Cause.csv")  
print("Dataset Shape:", df.shape)
print("Columns:", df.columns)

# 2. Missing Values Handling
# -----------------------------
print("\nMissing Values Before:\n", df.isnull().sum())

# Strategy:
# - Numeric columns → fill with mean
# - Categorical columns → fill with mode

for col in df.columns:
    if df[col].dtype in ['int64', 'float64']:
        df[col].fillna(df[col].mean(), inplace=True)
    else:
        df[col].fillna(df[col].mode()[0], inplace=True)

print("\nMissing Values After:\n", df.isnull().sum())

# 3. Basic EDA
# -----------------------------

# Avg delay per airline
avg_delay_airline = df.groupby("carrier_name")["arr_delay"].mean().sort_values(ascending=False)
print("\nAverage Delay by Airline:\n", avg_delay_airline)

# Airport-wise delay
avg_delay_airport = df.groupby("airport_name")["arr_delay"].mean().sort_values(ascending=False)
print("\nAverage Delay by Airport:\n", avg_delay_airport)

# Visualization - Delay reasons distribution
plt.figure(figsize=(8,6))
delay_cols = ["carrier_delay","weather_delay","nas_delay","security_delay","late_aircraft_delay"]
df[delay_cols].sum().plot(kind="bar")
plt.title("Total Delay Reasons (Minutes)")
plt.xlabel("Reason")
plt.ylabel("Total Delay (Minutes)")
plt.show()

# -----------------------------
# 4. MySQL Connection
# -----------------------------
username = "root"      
password = "Tejas" 
host = "localhost"
database = "airline_delay"   

# SQLAlchemy engine
engine = create_engine(f"mysql+mysqlconnector://{username}:{password}@{host}/{database}")

# -----------------------------
# 5. Export to MySQL
# -----------------------------
df.to_sql("airline_delays", con=engine, if_exists="replace", index=False)
print("✅ Data Imported Successfully into MySQL!")
