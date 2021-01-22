import React from "react";
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import { Badge } from 'react-bootstrap';

describe('components/Tags', () => {
  let tags;
  let container = null;

  beforeEach(() => {

    tags = [
      { id: 1, name: 'testTag1' },
      { id: 2, name: 'testTag2' },
      { id: 3, name: 'testTag3' }
    ]

    container = document.createElement("div");
    document.body.appendChild(container);
  });

  afterEach(() => {
    unmountComponentAtNode(container);
    container.remove();
    container = null;
  });

  it("display tags", () => {
    act(() => {
      render(tags.map(tag =>
        <Badge key={tag.id} pill className="mr-1 base_bg_color tag-padding">
          <a href={'/tags/' + tag.id} className="white-text">
            {tag.name}
          </a>
        </Badge>
      ), container);
    });
    const test = container.querySelectorAll('a');
    test.forEach((t, idx) => {
      expect(t.textContent).toBe(tags[idx].name);
    })
  });
})
