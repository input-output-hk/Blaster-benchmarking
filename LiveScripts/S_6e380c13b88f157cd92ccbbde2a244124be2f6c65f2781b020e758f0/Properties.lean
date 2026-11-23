import LiveScripts.Shared
import LiveScripts.S_6e380c13b88f157cd92ccbbde2a244124be2f6c65f2781b020e758f0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e380c13b88f157cd92ccbbde2a244124be2f6c65f2781b020e758f0.script [ctx] 10000]
