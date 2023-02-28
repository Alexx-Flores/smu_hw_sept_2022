from sqlalchemy import create_engine
import pandas as pd

class SQLHelper():
    
    def __init__(self):
        self.database_path = "Resources/hawaii.sqlite"
        self.connection_str = f"sqlite:///{self.database_path}"
        self.engine = create_engine(self.connection_str)

    def executeQuery(self, query):
        df = pd.read_sql(query, self.engine)
        return(df)
    
    def getPrcp(self):
        query = """
                    SELECT
                        date,
                        station,
                        prcp
                    FROM
                        measurement
                    WHERE
                        date>='2016-08-23'
                        and prcp is not null
                    ORDER BY
                        date asc,
                        station asc;
                """
        return(self.executeQuery(query))

    def getStation(self):
        query = """
                    SELECT 
                        * 
                    FROM 
                        station 
                    ORDER BY
                         id asc;
                """
        return(self.executeQuery(query))

    def getTobs(self, start_date):
        query = f"""SELECT
                        min(tobs) as min_tobs,
                        max(tobs) as max_tobs,
                        avg(tobs) as avg_tobs
                    FROM
                        measurement
                    WHERE
                        date >= '{start_date}';
                """
        return(self.executeQuery(query))

    def getTobsRange(self, start_date, end_date):
        query = f"""SELECT
                        min(tobs) as min_tobs,
                        max(tobs) as max_tobs,
                        avg(tobs) as avg_tobs
                    FROM
                        measurement
                    WHERE
                        date>= '{start_date}'
                        AND date <= '{end_date}';
                """
        return(self.executeQuery(query))