import LiveScripts.Shared
import LiveScripts.S_0d55973ecc3066163f8383575f0969fba9b544e3f8f52a18b021e5ea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0d55973ecc3066163f8383575f0969fba9b544e3f8f52a18b021e5ea.script [ctx] 10000]
