import LiveScripts.Shared
import LiveScripts.S_b2f218a3e0818bf348f5a5f863a6920bc57302d0b2082ab7435a961c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b2f218a3e0818bf348f5a5f863a6920bc57302d0b2082ab7435a961c.script [ctx] 10000]
