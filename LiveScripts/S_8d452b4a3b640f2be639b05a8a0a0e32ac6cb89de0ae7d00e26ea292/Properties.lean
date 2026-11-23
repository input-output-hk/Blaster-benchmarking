import LiveScripts.Shared
import LiveScripts.S_8d452b4a3b640f2be639b05a8a0a0e32ac6cb89de0ae7d00e26ea292.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8d452b4a3b640f2be639b05a8a0a0e32ac6cb89de0ae7d00e26ea292.script [ctx] 10000]
