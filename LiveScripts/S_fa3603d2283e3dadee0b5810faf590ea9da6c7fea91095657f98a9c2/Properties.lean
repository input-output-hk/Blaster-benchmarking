import LiveScripts.Shared
import LiveScripts.S_fa3603d2283e3dadee0b5810faf590ea9da6c7fea91095657f98a9c2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fa3603d2283e3dadee0b5810faf590ea9da6c7fea91095657f98a9c2.script [datum, redeemer, ctx] 10000]
