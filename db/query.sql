


  select * from users where phone ='09120000001';
  update users set email ='apstudent2019@gmail.com' where phone ='09120000001';
  update users set updated_at = now() where phone ='09120000001';
  select * from users where phone ='09120000001';



select title from channel where id in (select channel_id from ChannelMembership where user_id in (select id from users where phone ='09120000001'));

select count(id) from users where id in (select user_id from ChannelMembership where channel_id in (select id from channel where telegram_id ='aut_ap_2019'));


select email from users where substring(phone, 1, 4) = '0935';


select phone from users where id in ( select blocked_user_id from BlockUser where blocker_user_id in (select id from users where phone ='09120000001'));

select  message_text from messages where sender_id in( select id from users where telegram_id in('amir.jahanshahi','sHDiV4RHs'))
and receiver_id in( select id from users where telegram_id in('amir.jahanshahi','sHDiV4RHs')) order by id desc limit 10;

delete from messages where sender_id in( select id from users where telegram_id in('amir.jahanshahi','sHDiV4RHs'))
and receiver_id in( select id from users where telegram_id in('amir.jahanshahi','sHDiV4RHs'));
