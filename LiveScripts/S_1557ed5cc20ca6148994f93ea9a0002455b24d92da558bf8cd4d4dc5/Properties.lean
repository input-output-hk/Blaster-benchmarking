import LiveScripts.Shared
import LiveScripts.S_1557ed5cc20ca6148994f93ea9a0002455b24d92da558bf8cd4d4dc5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1557ed5cc20ca6148994f93ea9a0002455b24d92da558bf8cd4d4dc5.script [datum, redeemer, ctx] 10000]
