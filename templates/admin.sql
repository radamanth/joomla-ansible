#INSERT  INTO `medicjoomla_users`   (`name`, `username`, `password`, `params`)
#SELECT * FROM (SELECT 'Administrator', 'radamanth', md5('toto42'), '') AS TMP
#WHERE NOT EXISTS (
#        select `username`
#        from `medicjoomla_users`
#        where `username` = 'radamanth'
#) LIMIT 1;


#INSERT INTO `medicjoomla_user_usergroup_map` (`user_id`,`group_id`) VALUES (LAST_INSERT_ID(),'8')
#WHERE NOT EXISTS (select `username` from `medicjoomla_users` where `username` = 'radamanth');


INSERT  INTO `medicjoomla_users`   (`name`, `username`, `password`, `params`) VALUES ('Administrator', 'radamanth', md5('toto42'), '');
INSERT INTO `medicjoomla_user_usergroup_map` (`user_id`,`group_id`) VALUES (LAST_INSERT_ID(),'8');