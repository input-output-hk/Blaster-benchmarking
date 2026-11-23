import LiveScripts.Shared
import LiveScripts.S_8a96fdd361fd5372093ea49715b5388e4ab0dc313b4aef2f65e56127.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a96fdd361fd5372093ea49715b5388e4ab0dc313b4aef2f65e56127.script [ctx] 10000]
