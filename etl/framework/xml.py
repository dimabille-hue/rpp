from lxml import etree


def text(node, xpath, ns=None):

    item = node.find(xpath, ns or {})

    if item is None:
        return None

    return item.text
