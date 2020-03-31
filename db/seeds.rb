User.create(id: "1d", username: "Alessandro Giannetti", photo_profile: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg")
User.create(id: "2d", username: "Edoardo Bini", photo_profile: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg")

Post.create(content: "sono magro e lunatico ", photo: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg", likes: 0, user_id: "1d")
Post.create(content: "sono magro e triste ", photo: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg", likes: 0, user_id: "1d")
Post.create(content: "sono magro e felice ", photo: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg", likes: 0, user_id: "1d")

Relationship.create(followed_id: "1d", follower_id: "2d")