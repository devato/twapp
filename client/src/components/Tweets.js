import React from "react";
import Loading from './Loading';
import { Segment, List } from 'semantic-ui-react';
import Client from './Client';
import NoMatch from './NoMatch';

class Tweets extends React.Component {

  state = {
    tweets: [],
    loading: true,
  }

  componentDidMount() {
    this.setState({loading: true})
    Client.getTweets(this.props.match.params.topicId, (results) => {
      this.setState({
        tweets: results.data,
        loading: false,
      })
    })
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

    if (tweets.type === 'api_error') {
      return <NoMatch />
    }

    return (
      <div>
        {loading ? (
          <Loading />
        ) : (
          <Segment className="tweets-wrapper">
            <h2>#{this.props.match.params.topicId}</h2>
            <hr/>
            <List divided relaxed>
              {tweets.map((tweet, i) => {
                return (
                  <List.Item key={i}>
                    <List.Icon name="twitter" size="large" verticalAlign="middle" />
                    <List.Content>
                      <List.Header>@{tweet.attributes.username}</List.Header>
                      {tweet.attributes.full_text}
                      <List.Description>{tweet.attributes.tweeted_at}</List.Description>
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
