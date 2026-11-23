import LiveScripts.Shared
import LiveScripts.S_a01a67a08547a21ba3b40aabe1833da1c97436dc0d3dd99e97d34c3a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a01a67a08547a21ba3b40aabe1833da1c97436dc0d3dd99e97d34c3a.script [ctx] 10000]
