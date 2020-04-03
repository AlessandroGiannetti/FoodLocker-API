User.create(id: "J0I3W3G4e3QCI4dNvWpMf8VMBHL2", username: "Alessandro Giannetti", photo_profile: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg")
User.create(id: "2d", username: "Edoardo Bini", photo_profile: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg")

Post.create(content: "sono magro e lunatico ", photo: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg", likes: 0, user_id: "2d")
Post.create(content: "sono magro e triste ", photo: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg", likes: 0, user_id: "2d")
Post.create(content: "sono magro e felice ", photo: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631260305223E03_DXXX.jpg", likes: 0, user_id: "2d")
Post.create(content: "Oggi ho veramente mangiato troppo! prima di andare a dormire mi sono mangiato un 100 grammi di noci e 2 yogurt! ", photo: "", likes: 0, user_id: "2d")

Relationship.create(followed_id: "2d", follower_id: "J0I3W3G4e3QCI4dNvWpMf8VMBHL2")