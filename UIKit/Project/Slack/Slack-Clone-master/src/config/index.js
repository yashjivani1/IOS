import mongodb from 'mongodb';

export default {
  // "port": 3005,
  // "mongoUrl": "mongodb://localhost:27017/chat-api",
  "port": process.env.PORT,
  "mongoUrl": "mongodb+srv://hacoIOS:slackclone@cluster0-imbia.mongodb.net/test?retryWrites=true&w=majority",
  "bodyLimit": "100kb"
}
