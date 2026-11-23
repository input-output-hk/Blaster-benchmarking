import LiveScripts.Shared
import LiveScripts.S_bd74211843c2ea0bb3dd3fe2ec3ee22dcb2f69d3cf6ff7393231b8bf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bd74211843c2ea0bb3dd3fe2ec3ee22dcb2f69d3cf6ff7393231b8bf.script [datum, redeemer, ctx] 10000]
