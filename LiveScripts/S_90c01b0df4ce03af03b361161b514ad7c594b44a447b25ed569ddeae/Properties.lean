import LiveScripts.Shared
import LiveScripts.S_90c01b0df4ce03af03b361161b514ad7c594b44a447b25ed569ddeae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_90c01b0df4ce03af03b361161b514ad7c594b44a447b25ed569ddeae.script [ctx] 10000]
