import LiveScripts.Shared
import LiveScripts.S_9ee8aa0eaa65dbe04e96c4a9ef64b178113c647fe785ff6b4da3b837.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9ee8aa0eaa65dbe04e96c4a9ef64b178113c647fe785ff6b4da3b837.script [ctx] 10000]
