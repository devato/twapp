import React from "react";
import Client from "./Client";
import { Dropdown } from 'semantic-ui-react'

const MATCHING_ITEM_LIMIT = 3;

class TopicSelect extends React.Component {
  state = {
    topics: [],
    isLoading: true,
  };

  componentDidMount() {
    Client.getTopics(result => {
      this.setState({
        topics: this.setTopics(result.data),
        isLoading: false
      })
    });
  }

  setTopics(data) {
    const options = data.map((topic,i) => {
      return {key: i, text: topic.attributes.name, value: topic.attributes.slug }
    })
    return options;
  }

  render() {
    const { topics, isLoading } = this.state;
    return (
      <div id="topic-search">
        <Dropdown rel="topicSelect" text="select" selection options={topics} loading={isLoading} />
      </div>
    );
  }
}

export default TopicSelect;
