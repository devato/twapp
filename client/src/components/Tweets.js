import React from "react";

const Tweets = ({ match }) => (
  <div className="tweets">
    <p> tweets {match.params.topicId}</p>
  </div>
)

export default Tweets;
