import React from "react";
import Loading from './Loading';
import { Segment, List } from 'semantic-ui-react';
import Client from './Client';

class Tweets extends React.Component {

  state = {
    tweets: [],
    loading: true,
  }

  componentWillReceiveProps(newProps) {
    this.setState({loading: true})
    Client.getTweets(newProps.match.params.topicId, (results) => {
      this.setState({
        tweets: results.data,
        loading: false,
      })
    })
  }

  render() {
    const { loading, tweets } = this.state;
    return (
      <div>
        {loading ? (
          <Loading />
        ) : (
          <Segment>
            <h3>#{this.props.match.params.topicId}</h3>
            <List divided relaxed>
              {tweets.map((tweet, i) => {
                return (
                  <List.Item key={i}>
                    <List.Icon name="github" size="large" verticalAlign="middle" />
                    <List.Content>
                      <List.Header>@{tweet.attributes.username}</List.Header>
                      {tweet.attributes.full_text}
                      <List.Description>Updated {tweet.attributes.tweeted_at}</List.Description>
                    </List.Content>
                  </List.Item>
                )
              })}
            </List>
          </Segment>
        )}
      </div>
    )
  }
}

export default Tweets;
