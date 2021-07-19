# DTW Period Schema 

| Name      | Property | Type  | Description |
| :---      | :----:   | :---: | :-------    |
| Start date  | dtw_period_startdate | long | The start of the tracking period |
| End date  | dtw_period_end_date | long | The end of the tracking period |
| Duration  | dtw_period_duration | long | The duration of the tracking period |
| Milestone | dtw_period_entry_milestone | enum | Frequency of entries for the duration (i.e min 1-hour, 2-hour, 8-hours, max 24 hours). Divisible by 4. |
| Sleep start time   | dtw_sleep_start_time | time | Tracking halts due to bedtime |
| Sleep end time | dtw_sleep_end_time | time | Tracking resumes after bedtime |
| Last modified | dtw_last_modified | long | The date of the last change to the period or it's latest entry |
