import sublime
import sublime_plugin
import re

class CopyDiffCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    chunks = []
    for region in self.view.sel():
      chunks.append(self.view.substr(region))
    text = '\n'.join(chunks)
    text = re.sub(r"^[-+ ]", '', text, flags=re.M)
    sublime.set_clipboard(text)
    sublime.status_message('Copied ' + text)

  def is_enabled(self):
    return 'source.diff' in self.view.scope_name(0)
