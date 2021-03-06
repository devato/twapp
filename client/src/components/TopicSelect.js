import React from "react";
import { Segment } from 'semantic-ui-react';
import { NavLink } from "react-router-dom";

const TopicSelect = ({ match, topicsLoading, topics }) => (
  <Segment color="grey" loading={topicsLoading} className="topic-menu">
    <h4>Choose a Topic</h4>
    <div className="ui secondary vertical menu">
      {topics.map((topic, i) => {
        return <NavLink to={`/${topic.value}`}
        className="item" key={i}
        activeClassName="active">{topic.name}</NavLink>
      })}
    </div>
  </Segment>
)

export default TopicSelect;
