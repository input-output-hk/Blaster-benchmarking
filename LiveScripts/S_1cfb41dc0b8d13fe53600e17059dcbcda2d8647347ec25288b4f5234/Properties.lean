import LiveScripts.Shared
import LiveScripts.S_1cfb41dc0b8d13fe53600e17059dcbcda2d8647347ec25288b4f5234.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1cfb41dc0b8d13fe53600e17059dcbcda2d8647347ec25288b4f5234.script [datum, redeemer, ctx] 10000]
