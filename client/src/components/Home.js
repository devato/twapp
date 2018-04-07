import React from 'react';
import { Segment } from 'semantic-ui-react';
import TweetForm from './TweetForm'

const Home = () => (
  <div>
    <Segment color="grey" className="home-wrapper">
      <h2>Recent Tweets</h2>
      <hr/>
      <p>Select a topic to see the most recent tweets.</p>
    </Segment>
  </div>
)
export default Home;
