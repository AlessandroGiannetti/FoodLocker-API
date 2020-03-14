source: https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one


authentication:
curl -H "Content-Type: application/json" -X POST -d '{"email":"pippo@solo.io","password":"123"}'  https://foodlockerff.herokuapp.com/authenticate
requests:
curl -H "Authorization: token" https://foodlockerff.herokuapp.com/users




add user from bash:
http POST :3000/users/ name=mimmo surname=solo email=234 password=123 admin=false

modify user from bash:
http PUT :3000/users/1 name=paperino

add diary to a user:
http POST :3000/users/1/diaries

add extrainfo to a user:
http POST :3000/users/2/extrainfos age=11 gender=M weight=89 height=180 target_weight=78 water=4 sport_time=2 daily_kcal=2000
