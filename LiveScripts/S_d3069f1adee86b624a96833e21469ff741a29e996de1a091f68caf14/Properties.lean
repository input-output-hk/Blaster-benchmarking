import LiveScripts.Shared
import LiveScripts.S_d3069f1adee86b624a96833e21469ff741a29e996de1a091f68caf14.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d3069f1adee86b624a96833e21469ff741a29e996de1a091f68caf14.script [datum, redeemer, ctx] 10000]
