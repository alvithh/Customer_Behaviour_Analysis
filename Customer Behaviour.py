import pandas as pd
df=pd.read_csv(r"C:\Users\alvit\Downloads\customer_shopping_behavior.csv")

df.head()

df.describe(include='all')

df.isnull().sum()

df['Review Rating']=df.groupby('Category')['Review Rating'].transform(lambda x:x.fillna(x.median()))

df.isnull().sum()

df.columns=df.columns.str.lower()

df.columns=df.columns.str.replace(' ','_')

df=df.rename(columns={'Purchase Amount_(usd)':'purchase_amount'})

df.columns

#Create a column  age_group
labels=['Young Adult','Adult','Midlle-aged','Senior']
df['age_group']=pd.qcut(df['age'],q=4,labels=labels)

df[['age','age_group']].head(10)

# Create a column Purchase frequency days
frequency_mapping={
    'Fortnightly':15,
    'weekly':7,
    'monthly':30,
    'Quaterly':90,
    'Bi-weekly':14,
    'Annually':365,
    'Every 3 months':90
}
df['purchase_frequency_days']=df['frequency_of_purchases'].map(frequency_mapping)

df[['purchase_frequency_days','frequency_of_purchases']].head(10)

df[['discount_applied','promo_code_used']].head(10)

(df['discount_applied']==df['promo_code_used']).all()

df.drop('promo_code_used',axis=1)

df.columns

pip install psycopg2-binary sqlalchemy
# Import required libraries
from sqlalchemy import create_engine
import pandas as pd

# MySQL connection details (MATCHING MySQL Workbench)
username = "root"
password = "Alvith172830"   # same password you use in MySQL Workbench
host = "localhost"
database = "customer_behaviour"

# Create MySQL engine
engine = create_engine(
    f"mysql+pymysql://{username}:{password}@{host}/{database}"
)

# Read CSV file
df = pd.read_csv(
    r"C:\Users\alvit\Downloads\customer_shopping_behavior.csv"
)

# Upload data to MySQL
df.to_sql(
    name="customer",
    con=engine,
    if_exists="replace",   # first run → replace
    index=False
)

print("✅ Customer Behaviour data uploaded successfully into MySQL Workbench!")
