import React from 'react';
import { Message, Segment, Button, Form, TextArea } from 'semantic-ui-react'
import Client from './Client'

class TweetForm extends React.Component {

  state = {
    loading: false,
    tweeted: false,
    tweet_path: '',
  }

  handleChange = (e, { name, value }) => {
    this.setState({
      text: value
    })
  }

  handleSubmit = () => {
    const { text } = this.state
    this.setState({ loading: true })

    Client.postTweet(text, results => {
      this.setState({
        tweeted: true,
        loading: false,
        tweet_path: results.tweet_path,
        tweet_id: results.tweet_id,
        text: ''
      })
    })
  }

  render() {
    const { loading, tweeted, tweet_path, text } = this.state;

    return (
      <Segment>

        { tweeted &&
          <div>
            <Message success content='Your tweet has been posted' />
            <a href={`https://twitter.com${tweet_path}`}>Click here to view it</a>
          </div>
        }
        <Form onSubmit={this.handleSubmit} loading={loading}>
          <h3>New Tweet</h3>
          <Form.Field name='text' value={text} control={TextArea} onChange={this.handleChange} />
          <Form.Field control={Button}>Tweet</Form.Field>
        </Form>
      </Segment>
    );
  }

}

export default TweetForm;
