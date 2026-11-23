import LiveScripts.Shared
import LiveScripts.S_d6ba9b7509eac866288ff5072d2a18205ac56f744bc82dcd808cb8fe.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d6ba9b7509eac866288ff5072d2a18205ac56f744bc82dcd808cb8fe.script [datum, redeemer, ctx] 10000]
