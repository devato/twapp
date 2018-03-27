import React from 'react'
import { Segment } from 'semantic-ui-react';

const NoMatch = () => (
  <Segment color="grey" className="home-wrapper">
    <h2>Recent Tweets</h2>
    <hr/>
    <p>Topic not found. Select a topic to see the most recent tweets.</p>
  </Segment>
)

export default NoMatch;
