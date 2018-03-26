import React from 'react'
import { Image, Segment } from 'semantic-ui-react'
import paragraphImg from '../assets/images/paragraph.png';

const Loading = () => (
  <Segment loading>
    <Image src={paragraphImg} />
    <h3>test</h3>
  </Segment>
)

export default Loading
