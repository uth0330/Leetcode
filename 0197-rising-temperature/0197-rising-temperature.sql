SELECT  t1.id
        # , t1.recordDate
        # , t1.recordDate_prev
        # , DATEDIFF(t1.recordDate, t1.recordDate_prev)
        # , t1.temperature
        # , t1.temperature_prev
        # # , t1.temperature - t1.temperature_prev
FROM    (SELECT id
                , recordDate
                , LAG(recordDate, 1) OVER
                    (
                        ORDER BY recordDate
                    ) recordDate_prev
                , temperature
                , LAG(temperature, 1) OVER  
                    (
                        ORDER BY recordDate
                    ) temperature_prev
        FROM    weather) t1
WHERE   1 = 1
    AND DATEDIFF(t1.recordDate, t1.recordDate_prev) = 1
    AND t1.temperature - t1.temperature_prev > 0
ORDER BY    t1.id

# SELECT id
#                 , recordDate
#                 , LAG(recordDate, 1) OVER
#                     (
#                         ORDER BY recordDate
#                     ) recordDate_prev
#                 , temperature
#                 , LAG(temperature, 1) OVER  
#                     (
#                         ORDER BY recordDate
#                     ) temperature_prev
#         FROM    weather