# DTW Entry Schema


| Name      | Property | Type  | Description |
| :---      | :----:   | :---: | :-------    |
| PeriodId  | dtw_period_id | int | Id of the dtw period |
| Datetime  | dtw_datetime | datetime | Date and time of the entry |
| Activity  | dtw_activity | enum     | What are you doing now? Limit to a list of activities for analysis. Label of after the fact. |
| Alertness | dtw_alertness | int      | Rate you level of alertness on a scale of 1-10.
| Energy    | dtw_energy   | int      | Rate your energy level on a scale of 1-10.| 
