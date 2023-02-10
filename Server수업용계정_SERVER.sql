UPDATE MEMBER
    SET USER_NAME = ?
      , PHONE = ?
      , EMAIL = ?
      , ADDRESS = ?
      , INTEREST = ?
      , MODIFY_DATE = SYSDATE
WHERE   USER_ID = ?