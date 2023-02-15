SELECT *
    FROM (SELECT ROWNUM RNUM, A.*
          FROM (
        SELECT
               BOARD_NO
             , CATEGORY_NAME
             , BOARD_TITLE
             , USER_ID
             , COUNT
             , TO_CHAR(CREATE_DATE, 'YYYY/MM/DD') "CREATE_DATE"
          FROM BOARD B
          JOIN CATEGORY USING(CATEGORY_NO)
          JOIN MEMBER ON (BOARD_WRITER = USER_NO)
         WHERE BOARD_TYPE = 1
           AND B.STATUS = 'Y'
         ORDER
            BY BOARD_NO DESC
             ) A
         )
         WHERE RNUM BETWEEN ? AND ?