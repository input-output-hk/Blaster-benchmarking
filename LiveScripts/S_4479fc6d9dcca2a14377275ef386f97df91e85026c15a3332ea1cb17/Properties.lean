import LiveScripts.Shared
import LiveScripts.S_4479fc6d9dcca2a14377275ef386f97df91e85026c15a3332ea1cb17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4479fc6d9dcca2a14377275ef386f97df91e85026c15a3332ea1cb17.script [ctx] 10000]
