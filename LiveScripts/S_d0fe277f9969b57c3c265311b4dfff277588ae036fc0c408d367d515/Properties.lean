import LiveScripts.Shared
import LiveScripts.S_d0fe277f9969b57c3c265311b4dfff277588ae036fc0c408d367d515.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d0fe277f9969b57c3c265311b4dfff277588ae036fc0c408d367d515.script [ctx] 10000]
